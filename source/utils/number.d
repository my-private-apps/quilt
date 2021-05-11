module utils.number;

import std.algorithm;

abstract class NumberUtilities {
    // Create the sum value of an iterable passed into 
    // the function.
    // The function find the sum of the elements by
    // first sorting the array and then find the sum
    // using arithmetic progression
    // n(n+1)/2 where n is the last member of the array
    public static double createIterableSum(double[] values){
        double[] sortedValues = values.sort();
        if(sortedValues.length == 0){
            return 0;
        }
        int lastMember = sortedValues[(cast(int) sortedValues.length)-1];
        return (n*(n+1))/2;
    }
}