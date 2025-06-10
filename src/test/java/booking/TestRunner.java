package booking;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testPatchBooking() {
        return Karate.run("test").relativeTo(getClass());
    }
}
