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
    output.y = (0.257 * pixel.r) + (0.504 * pixel.g) + (0.098 * pixel.b) + 16.0;
    output.cb = -(0.148 * pixel.r) - (0.291 * pixel.g) + (0.439 * pixel.b) + 128.0;
    output.cr = (0.439 * pixel.r) - (0.368 * pixel.g) - (0.071 * pixel.b) + 128.0;
    return output;
}

float rgb_to_ycc_y(rgb pixel)
{
    return (0.257 * pixel.r) + (0.504 * pixel.g) + (0.098 * pixel.b) + 16.0;
}

ycc rgb_to_ycc_avg(rgb w, rgb x, rgb y, rgb z)
{
    ycc average;
    ycc yccw = rgb_to_ycc(w);
    ycc yccx = rgb_to_ycc(x);
    ycc yccy = rgb_to_ycc(y);
    ycc yccz = rgb_to_ycc(z);

    average.y = (yccw.y + yccx.y + yccy.y + yccz.y) / 4.0;
    average.cb = (yccw.cb + yccx.cb + yccy.cb + yccz.cb) / 4.0;
    average.cr = (yccw.cr + yccx.cr + yccy.cr + yccz.cr) / 4.0;
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

