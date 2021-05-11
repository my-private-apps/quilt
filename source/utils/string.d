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

    public static string[] split(string data, char separator){
        string[] components = [];
        string current_string = "";
        for(int index=0; index<cast(int) data.length; index++){
            char current_character = data[index];
            if(current_character == separator){
                components ~= current_string;
                current_string = "";
            } else {
                current_string ~= current_character;
            }
        }
        return components;
    }
}