VFPtoCSharpBridge
=================

Visual FoxPro to CSharp Bridge/Wrapper/Proxy

This code allows C# to call into a FoxPro program via COM interop.


Example
------
In the C# file add a reference to the VDP dll you created using the bridge code.  
Also add a using statement at the top of your C# file.  
Note: RegSvr32.exe is required for your DLL to work. Google how to use this.  

```cs
using myFoxProBridge; // Requires: RegSvr32.exe myFoxProBridge.dll

```

later in code 

```cs
VFPtoCSharpBridgeClass vfPtoCSharpBridge = new VFPtoCSharpBridgeClass();
if (vfPtoCSharpBridge.RunVFP("myData") != 0)
{
  throw new COMException(vfPtoCSharpBridge.getErrorMessage());
}
```
