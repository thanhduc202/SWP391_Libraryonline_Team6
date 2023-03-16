/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author tient
 */
public class Method {
    private int MethodID;
    private String methodName;
    private int count;

    public Method() {
    }

    public Method(int MethodID, String methodName, int count) {
        this.MethodID = MethodID;
        this.methodName = methodName;
        this.count = count;
    }

    public int getMethodID() {
        return MethodID;
    }

    public void setMethodID(int MethodID) {
        this.MethodID = MethodID;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    
}
