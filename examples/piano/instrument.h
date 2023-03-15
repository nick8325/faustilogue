//Set of C++ wave table function 
//©Romain Michon (rmichon@ccrma.stanford.edu), 2011
//licence: STK-4.3

#include <stdio.h>
#include <stdlib.h>

//******************************************************
//functions for parameters lookup and interpolation 
//******************************************************

class LookupTable
{
public:
	LookupTable(float *points, int num_points);
	float getValue(float x);
	
protected:
	
	// Note: Actual array size is 2*m_nPoints;
	float *m_Points;
	int m_nPoints;
};

LookupTable::LookupTable(float *points, int num_points)
{
	// Note: Actual array size is 2*num_points
	
	m_Points = points;
	m_nPoints = num_points;
}

float LookupTable::getValue(float x)
{
	// Note: Assumes points are monotonically increasing in X!
	
	int i=0;
	while (x>m_Points[i*2] && i<m_nPoints)
		i++;
	
	if (i==0)
		return m_Points[1];
	
	if (i>=m_nPoints)
		return m_Points[(m_nPoints-1)*2+1];
	
	float ratio =
	(x - m_Points[(i-1)*2])
	/ (m_Points[i*2] - m_Points[(i-1)*2]);
	
	return m_Points[(i-1)*2+1]*(1-ratio) + m_Points[i*2+1]*(ratio);
}
