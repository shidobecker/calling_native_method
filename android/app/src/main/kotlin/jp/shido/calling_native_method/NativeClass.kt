package jp.shido.calling_native_method

class NativeClass {

    fun getResult(): String {
        return "Result from ${NativeClass::class.simpleName}"
    }


}