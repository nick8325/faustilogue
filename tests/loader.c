#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include "userosc.h"

#define die(msg) do { perror(msg); exit(1); } while(0)

#define LOADADDR 0x20000000
#define LOADSIZE (32*1024)
#define BUFSIZE 64
#define SAMPLERATE 48000
#define NOTE_LENGTH 0.5f
#define NOTE_LOW 40
#define NOTE_HIGH 100

user_osc_hook_table_t *osc = (user_osc_hook_table_t *) LOADADDR;

int main(int argc, char ** argv) {
    if (argc != 3) {
        printf("expected: .bin file to load, .wav file to write\n");
        exit(1);
    }

    void *addr = mmap(osc, LOADSIZE, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (addr == MAP_FAILED) die("mmap");

    int binfd = open(argv[1], O_RDONLY);
    if (binfd == -1) die("open .bin");
    int status = read(binfd, addr, LOADSIZE);
    if (status == -1) die("read");
    close(binfd);

    if (memcmp(osc->magic, "UOSC", 4) != 0) {
        printf("invalid magic\n");
        exit(1);
    }
    
    int wavfd = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (wavfd == -1) die("open .wav");

    printf("Calling entry point\n");
    osc->func_entry(k_user_target_miniloguexd | k_user_module_osc, k_user_api_1_1_0);

    q31_t buffer[BUFSIZE];
    user_osc_param_t param = {
        .shape_lfo = 0,
        .pitch = 60 << 8,
        .cutoff = 0xfff,
        .resonance = 0xfff
    };

    for (int note = NOTE_HIGH; note >= NOTE_LOW; note--) {
        printf("Triggering NOTE ON event %d\n", note);
        param.pitch = note << 8;
        osc->func_on(&param);

        printf("Generating %fs of sound\n", NOTE_LENGTH);
        for (int i = 0; i < SAMPLERATE * NOTE_LENGTH / BUFSIZE; i++) {
            osc->func_cycle(&param, buffer, BUFSIZE);
            int ok = write(wavfd, buffer, sizeof buffer);
            if (ok == -1) die("write");
        }

        printf("Triggering NOTE OFF event %d\n", note);
        param.pitch = note << 8;
        osc->func_off(&param);

    }

    printf("Done!\n");
    close(wavfd);
}
