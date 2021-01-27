package io.hansel.react;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import io.hansel.core.logger.HSLLogger;
import io.hansel.ujmtracker.HanselInternalEventsListener;
import io.hansel.ujmtracker.HanselTracker;

/**
 * Created by avin on 20/09/18.
 */

public class HanselTrackerRn extends ReactContextBaseJavaModule {

    public HanselTrackerRn(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @ReactMethod
    public static void logEvent(String eventName, String vendor, ReadableMap hanselProperties, Callback callback) {
        HSLLogger.d("Bridge log called :::");
        HashMap<String, Object> result = HanselTracker.logEvent(eventName, vendor, hanselProperties.toHashMap());
        WritableMap map = Arguments.createMap();
        int n = result.size();
        List<String> keyList = new ArrayList<>(result.keySet());
        for (int i = 0; i < n; i++) {

            String key = keyList.get(i);
            Object value = result.get(key);
            try {
                if (value instanceof Double || value instanceof Integer || value instanceof Float || value instanceof Long) {
                    map.putDouble(key, Double.parseDouble(value + ""));
                } else if (value instanceof Boolean) {
                    map.putBoolean(key, (Boolean) value);
                } else if (value instanceof String) {
                    map.putString(key, (String) value);
                }

            } catch (Throwable e) {
                HSLLogger.printStackTrace(e);
            }

        }
        if (callback != null) {
            callback.invoke(map);
        }
    }

    @Override
    public String getName() {
        return "HanselTrackerRn";
    }

    @ReactMethod
    public void registerListener(HanselInternalEventsListener listener) {
        HanselTracker.registerListener(listener);
    }

    @ReactMethod
    public void deRegisterListener(HanselInternalEventsListener listener) {
        HanselTracker.deRegisterListener(listener);
    }

}
