module utils.number;

import std.algorithm;

abstract class NumberUtilities {
    // Create the sum value of an iterable passed into 
    // the function.
    // The function find the sum of the elements by
    // first sorting the array and then find the sum
    // using arithmetic progression
    // n(n+1)/2 where n is the last member of the array
    public static auto createIterableSum(double[] values){
        if(values.length == 0){
            return 0;
        }
        double n = values[(cast(int) values.length)-1];
        return (n*(n+1))/2;
    }
}