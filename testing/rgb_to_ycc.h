/* C program to convert a RGB bitmap to a YCbCr format bitmap.
 * Course: SENG 440
 * University of Victoria
 */
#ifndef RGB_TO_YCC_H
#define RGB_TO_YCC_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "util.h"


ycc rgb_to_ycc(rgb pixel)
{
    ycc output;

    output.y = clamp(((2105 * pixel.r)>>13 + (2064 * pixel.g)>>12 + (3211 * pixel.b)>>15 + 256),256,3760);
    output.cb = clamp((-(2425 * pixel.r)>>14 - (2384 * pixel.g)>>13 + (3596 * pixel.b)>>13 + 2048),256,3840);
    output.cr = clamp(((3596 * pixel.r)>>13 - (3015 * pixel.g)>>13 - (2327 * pixel.b)>>15 + 2048),256,3840);
    return output;
}

float rgb_to_ycc_y(rgb pixel)
{
    return clamp(((2105 * pixel.r)>>13 + (2064 * pixel.g)>>12 + (3211 * pixel.b)>>15 + 256),256,3760);
}

ycc rgb_to_ycc_avg(rgb w, rgb x, rgb y, rgb z)
{
    ycc average;
    ycc yccw = rgb_to_ycc(w);
    ycc yccx = rgb_to_ycc(x);
    ycc yccy = rgb_to_ycc(y);
    ycc yccz = rgb_to_ycc(z);

    average.y = (yccw.y + yccx.y + yccy.y + yccz.y)>>2;
    average.cb = (yccw.cb + yccx.cb + yccy.cb + yccz.cb)>>2;
    average.cr = (yccw.cr + yccx.cr + yccy.cr + yccz.cr)>>2;
    return average;
}

void matrix_rgb_to_ycc(rgb **in, ycc **out)
{
    int i, j;

    // do not subsample the Y value; every pixel is converted 
    // the Cb and Cr values are subsampled per 2x2 square
    for (i = 0; i < height-1; i+=2)
    {
        for (j = 0; j < width-1; j+=2)
        {
            out[i][j].y = rgb_to_ycc_y(in[i][j]);
            out[i+1][j].y = rgb_to_ycc_y(in[i+1][j]);
            out[i][j+1].y = rgb_to_ycc_y(in[i][j+1]);
            out[i+1][j+1].y = rgb_to_ycc_y(in[i+1][j+1]);

            ycc average = rgb_to_ycc_avg(in[i][j], in[i+1][j], in[i][j+1], in[i+1][j+1]);
            out[i][j].cb = average.cb;
            out[i+1][j].cb = average.cb;
            out[i][j+1].cb = average.cb;
            out[i+1][j+1].cb = average.cb;

            out[i][j].cr = average.cr;
            out[i+1][j].cr = average.cr;
            out[i][j+1].cr = average.cr;
            out[i+1][j+1].cr = average.cr;
        }
    }
}

#endif

