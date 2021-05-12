module utils.arrays;

abstract class ArrayUtilities {
    // Check whether a specific element is present in
    // a list of anytype[ArrayType]
    public static bool contains(ArrayType)(const ArrayType[] array, ArrayType find){
        for(int index=0; index<array.length; index++){
            if(array[index] == find){
                return true;
            }
        }
        return false;
    }
}