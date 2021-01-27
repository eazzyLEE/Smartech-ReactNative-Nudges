package io.hansel.react;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.HashMap;

import io.hansel.hanselsdk.Hansel;

/**
 * Created by avin on 21/09/18.
 */

public class HanselRn extends ReactContextBaseJavaModule {

    public HanselRn(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @ReactMethod
    public static void getInteractionMaps(Callback callback) {
        HashMap<String, String> journeysMap = Hansel.getInteractionMaps();
        if (callback != null) {
            callback.invoke(HSLReactConversionUtil.toWritableMap(journeysMap));
        }
    }

    @ReactMethod
    public static boolean onBackButtonPressed() {
        return Hansel.onBackButtonPressed();
    }

    @ReactMethod
    public static void onSetScreen(String screenName) {
        Hansel.onSetScreen(screenName);
    }

    @ReactMethod
    public static void onUnsetScreen() {
        Hansel.onUnsetScreen();
    }

    @ReactMethod
    public static void showToast(String text, boolean longDuration) {
        Hansel.showToast(text, longDuration);
    }

    @Override
    public String getName() {
        return "HanselRn";
    }

}
