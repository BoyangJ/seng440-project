#ifndef UTIL_H
#define UTIL_H

// Globals
int height;
int width;

typedef struct rgb
{
    int r;
     int g;
     int b;
} rgb;

typedef struct ycc
{
     int y;
     int cb;
     int cr;
} ycc;


unsigned int clamp(unsigned int in, unsigned int min, unsigned int max)
{
	return in < min ? min : in > max ? max : in;
} 

#endif
