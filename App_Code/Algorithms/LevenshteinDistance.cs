using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Algorithms
{
    /// <summary>
    /// Test 的摘要描述
    /// </summary>
    public class LevenshteinDistance
    {
        public LevenshteinDistance() { }

        public static float GetDistance(string s1, string s2)
        {

            int IsEqual = 0;
            int xlength = s1.Length;
            int ylength = s2.Length;
            int[,] matrix;


            if (xlength == 0)
            {
                return ylength;
            }

            if (ylength == 0)
            {
                return xlength;
            }

            matrix = new int[xlength + 1, ylength + 1];

            //初始化第一列
            for (int i = 0; i <= xlength; i++)
            {
                matrix[i, 0] = i;
            }

            //初始化第一行
            for (int j = 0; j <= ylength; j++)
            {
                matrix[0, j] = j;
            }

            for (int i = 1; i <= xlength; i++)
            {

                char ch = s1[i - 1];

                for (int j = 1; j <= ylength; j++)
                {

                    char ch2 = s2[j - 1];

                    if (ch.Equals(ch2))
                        IsEqual = 0;
                    else
                        IsEqual = 1;


                    int top = matrix[i - 1, j] + 1;
                    int left = matrix[i, j - 1] + 1;
                    int diagonal = matrix[i - 1, j - 1] + IsEqual;
                    matrix[i, j] = Math.Min(top, Math.Min(left, diagonal));

                }
            }

            //calculate the similarty 
            //1 - the last value of matrix / Max(s1,s2)
            return 1.0f - ((float)matrix[xlength, ylength] / Math.Max(s1.Length, s2.Length));
        }
    }

}