DEFINE CLASS VFPtoCSharpBridge AS Custom OLEPublic

    _ErrorMessage = ""
    _ReturnCode = 0
    _Result = ""
    
    * This Method is used to run VFP code where a returned value is not expected. 
    * But we would like to know if the code had an error or failed.
    * On success this returns a return code of 0 (Zero)
    * 
    * On Error the Error code is returned. Use the method getErrorMessage() to 
    * return the error message
    *
    * To return a value check if RunVFP() has a return code of 0 (Zero)
    * then call the method getResult(). The method getResult() currectly
    * returns a string. To return another Data Type just change the method
    * to Boolean, or Integer
    * 
    FUNCTION RunVFP() AS Integer
        TRY 
            * Your Code goes Here
            *SET PROCEDURE to XFDFCLASS
            this.setResult("MyResult")
        CATCH TO oErr 
            this.setErrorMessage(ALLTRIM(STR(oErr.ErrorNo)) + Chr(13) + Chr(10) + "Method: " + oErr.Procedure + "()" + Chr(13) + Chr(10) + "Line No: " + ALLTRIM(STR(oErr.LineNo)) + Chr(13) + Chr(10) + "Message: " + oErr.Message)
            this.setReturnCode(oErr.ErrorNo)
        ENDTRY
        RETURN this.getReturnCode()
    ENDFUNC

    * Change the Data Type "String" to the correct return data type.
    FUNCTION getResult() as String
        RETURN this._Result 
    ENDFUNC
    
    * Change the Data Type "String" to the correct data type.
    FUNCTION setResult(xValue) as VOID
        LOCAL xValue as String
        this._Result = xValue
    ENDFUNC     
    
    * +------------------------------------------------------+
    *  These next four functions are used for error handling. 
    *  They should be left as they are. 
    * +------------------------------------------------------+
    FUNCTION getErrorMessage() as String
        RETURN this._ErrorMessage
    ENDFUNC
    
    FUNCTION setErrorMessage(sValue) as VOID
        LOCAL sValue as String
        this._ErrorMessage = sValue
    ENDFUNC
    
    FUNCTION getReturnCode() as Integer
        RETURN this._ReturnCode 
    ENDFUNC
    
    FUNCTION setReturnCode(iValue) as VOID
        LOCAL iValue as Integer
        this._ReturnCode = iValue
    ENDFUNC
ENDDEFINE