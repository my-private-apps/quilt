module utils.string;

abstract class StringUtilities {
    public static bool startsWith(string find, string check){
        int characterLength = cast(int) check.length;
        if(cast(int) find.length < characterLength){
            return false;
        }
        string slice = StringUtilities.slice(find, characterLength);
        return slice == check;
    }

    public static string slice(string data, int length){
        string returnStringValue = "";
        for(int index=0; index<length; index++){
            returnStringValue ~= data[index];
        }
        return returnStringValue;
    }
}