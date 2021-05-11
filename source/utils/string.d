module utils.string;

abstract class StringUtilities {
    // Check if a string starts with a specific string
    // Find the length of the [check] string and 
    // compare the slice of [find] with [check]
    public static bool startsWith(string find, string check){
        int characterLength = cast(int) check.length;
        if(cast(int) find.length < characterLength){
            return false;
        }
        string slice = StringUtilities.slice(find, characterLength);
        return slice == check;
    }

    // Create a slice of a string from the beginning
    // to [length] characters 
    public static string slice(string data, int length){
        string returnStringValue = "";
        for(int index=0; index<length; index++){
            returnStringValue ~= data[index];
        }
        return returnStringValue;
    }
}