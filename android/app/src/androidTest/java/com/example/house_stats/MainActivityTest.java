package com.example.house_stats;

import androidx.test.rule.ActivityTestRule;
import dev.flutter.plugins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;

@RunWith(FlutterTestRunner.class)
public class MainActivityTest {
  @Rule
  public PatrolTestRule<MainActivity> rule = new PatrolTestRule<>(MainActivity.class, true, false);
}