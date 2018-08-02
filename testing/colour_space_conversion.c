/* C program to convert a RGB bitmap to a YCbCr format bitmap.
 * Course: SENG 440
 * University of Victoria
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
//#include "arm_neon.h"

#include "rgb_to_ycc.h"
#include "ycc_to_rgb.h"
#include "util.h"

#define READBUFFER 255


int main()
{
    FILE *fp;
    char buf[READBUFFER];
    fp = fopen("bits.rgb", "r");

    // get image width and height
    fscanf(fp, "%d", &width);
    fscanf(fp, "%d", &height);

    int i, j;

    rgb **input;
    ycc **output;

    // Initialization
    input = malloc(height * sizeof *input);
    output = malloc(height * sizeof *output);
    for (i = 0; i < height; ++i)
    {
        input[i] = malloc(width * sizeof *input[i]);
        output[i] = malloc(width * sizeof *output[i]);
    }
    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            // TEMPORARY SHIT
//            unsigned int a, b, c;
//            fscanf(fp, "%d %d %d", &a, &b, &c);
//            input[i][j].r = a * 16;
//            input[i][j].g = b * 16;
//            input[i][j].b = c * 16;

// ORIGINAL SHIT
            fscanf(fp, "%d %d %d", &input[i][j].r, &input[i][j].g, &input[i][j].b);
        }
    }

    fclose(fp);

    struct timeval start, end;
	//start time
    gettimeofday(&start,NULL);
    matrix_rgb_to_ycc(input, output);
	//end time
    gettimeofday(&end,NULL);
    double total_t = (end.tv_sec * 1000.0 + end.tv_usec/1000.0) - (start.tv_sec * 1000.0 + start.tv_usec/1000.0);
    printf("time for rgb -> ycc: %f\n",total_t);

    fp = fopen("optimized_out_1.ycc", "w");
    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            fprintf(fp, "%d %d %d\n", output[i][j].y, output[i][j].cb, output[i][j].cr);
        }
    }
    fclose(fp);


/* rgb -> ycc -> back to original rgb?? */
    rgb **original;
    original = malloc(height * sizeof *original);
    for (i = 0; i < height; ++i)
    {
        original[i] = malloc(width * sizeof *original[i]);
    }
	//start time
    gettimeofday(&start,NULL);
    matrix_ycc_to_rgb(output, original);
	//end time
    gettimeofday(&end,NULL);
    total_t = (end.tv_sec * 1000.0 + end.tv_usec/1000.0) - (start.tv_sec * 1000.0 + start.tv_usec/1000.0);
    printf("time for ycc -> rgb: %f\n",total_t);

    fp = fopen("optimized_orig_1.rgb", "w");
    for (i = 0; i < height; ++i)
    {
        for (j = 0; j < width; ++j)
        {
            fprintf(fp, "%d %d %d\n", original[i][j].r, original[i][j].g, original[i][j].b);
        }
    }
    fclose(fp);

    // free arrays
    for (i=0; i<height; i++)
    {
        free(input[i]);
        free(output[i]);
        free(original[i]);
    }
    free(input);
    free(output);
    free(original);



}
