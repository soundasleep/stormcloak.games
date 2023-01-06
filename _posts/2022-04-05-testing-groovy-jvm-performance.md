---
layout: post
title:  "Testing Groovy/JVM scripting engine performance"
date:   2022-04-05 12:48:00 +1200
author: Jevon Wright
year:   2022
truncate_words: 75
---

(Warning: _very_ technical gamedev post)

I did some quick testing on the performance of Java and [Groovy](https://groovy-lang.org/) (my preferred scripting engine), to see
where various game logic should occur, if it's being called potentially tens of thousands of times per second.

## Test specifications

Using Java 1.8 on Windows, Groovy 3.0.8, for 300k iterations of a simple `a < b` check. I ran the benchmark five times
so that the JVM and Groovy could warm up a bit first, but capturing the warmup/startup time is still useful, too.

| Method | First run, ms | Final run, ms |
| ---- | ---- | ---- |
| `a < b` | 19 | 1 |
| `get("a") < get("b")` | 6 | 3 |
| `op(get("a"), get("b"), "<")` | 13 | 3 |
| `eval("a < b", sharedBindings)` | 1422 | 622 |
| `eval("a < b", new Bindings(...))` | 699 | 688 |
| `eval("return get('a') < get('b')", sharedBindings)` | 837 | 772 |
| `eval("return get('a') < get('b')", new Bindings(...))` | 782 | 778 |

## Summary

As soon as you enter the Groovy scripting engine – at least the way that I'm doing it – performance slows down by about ~100x.

Jumping back into the JVM to get data slows execution down by about 10%, so it's better to put data into the bindings than to jump out of the Groovy scripting context.

## Source

Using the following source file:

```java
public class GroovyPerformanceTest {

  public static int runs = 5;
  public static long iterations = 300000l;

  public static void main(String[] arg) throws ScriptException {
    new GroovyPerformanceTest().run();
  }

  public void run() throws ScriptException {
    long time = System.currentTimeMillis();

    for (int i = 0; i < runs; i++) {
      // --
      for (long j = 0; j < iterations; j++) {
        expect(doInlineJava(i, j));
      }
      System.out.println("doInlineJava -> " + (System.currentTimeMillis() - time));
      time = System.currentTimeMillis();

      // --
      for (long j = 0; j < iterations; j++) {
        expect(doInlineJavaWithSomeSelectSwitches(i, j));
      }
      System.out.println("doInlineJavaWithSomeSelectSwitches -> " + (System.currentTimeMillis() - time));
      time = System.currentTimeMillis();

      // --
      for (long j = 0; j < iterations; j++) {
        expect(doInlineJavaWithSomeSelectSwitchesAndSelectOperation(i, j));
      }
      System.out.println("doInlineJavaWithSomeSelectSwitchesAndSelectOperation -> " + (System.currentTimeMillis() - time));
      time = System.currentTimeMillis();

      // --
      for (long j = 0; j < iterations; j++) {
        expect(doGroovyExecutionSharedBindings(i, j));
      }
      System.out.println("doGroovyExecutionSharedBindings -> " + (System.currentTimeMillis() - time));
      time = System.currentTimeMillis();

      // --
      for (long j = 0; j < iterations; j++) {
        expect(doGroovyExecutionNewBindings(i, j));
      }
      System.out.println("doGroovyExecutionNewBindings -> " + (System.currentTimeMillis() - time));
      time = System.currentTimeMillis();

      // --
      for (long j = 0; j < iterations; j++) {
        expect(doGroovyExecutionWithSelectionBackIntoJvm(i, j));
      }
      System.out.println("doGroovyExecutionWithSelectionBackIntoJvm -> " + (System.currentTimeMillis() - time));
      time = System.currentTimeMillis();

      // --
      for (long j = 0; j < iterations; j++) {
        expect(doGroovyExecutionWithSelectionBackIntoJvmNewBindings(i, j));
      }
      System.out.println("doGroovyExecutionWithSelectionBackIntoJvmNewBindings -> " + (System.currentTimeMillis() - time));
      time = System.currentTimeMillis();

    }

  }

  private void expect(boolean b) {
    if (!b) {
      throw new IllegalStateException();
    }
  }

  public boolean doInlineJava(int i, long j) {
    double a = 1.0 + MathUtils.random(1f);
    double b = 2.0 + MathUtils.random(1f);
    return a < b;
  }

  public boolean doInlineJavaWithSomeSelectSwitches(int i, long j) {
    double a = getSelectValue("a");
    double b = getSelectValue("b");
    return a < b;
  }

  public boolean doInlineJavaWithSomeSelectSwitchesAndSelectOperation(int i, long j) {
    double a = getSelectValue("a");
    double b = getSelectValue("b");
    return doOperation(a, b, "<");
  }

  private double getSelectValue(String s) {
    switch (s) {
    case "a": return 1.0 + MathUtils.random(1f);
    case "b": return 2.0 + MathUtils.random(1f);
    case "c": return 3.0 + MathUtils.random(1f);
    case "d": return 4.0 + MathUtils.random(1f);
    case "e": return 5.0 + MathUtils.random(1f);
    case "f": return 6.0 + MathUtils.random(1f);
    case "g": return 7.0 + MathUtils.random(1f);
    case "h": return 8.0 + MathUtils.random(1f);
    case "i": return 9.0 + MathUtils.random(1f);
    case "j": return 10.0 + MathUtils.random(1f);
    default: throw new IllegalArgumentException(s);
    }
  }

  private boolean doOperation(double a, double b, String op) {
    switch (op) {
    case "<": return a < b;
    case ">": return a > b;
    default: throw new IllegalArgumentException(op);
    }
  }

  private SimpleBindings bindings;

  private void initBindings(SimpleBindings bindings) {
    bindings.put("a", getSelectValue("a"));
    bindings.put("b", getSelectValue("b"));
    bindings.put("c", getSelectValue("c"));
    bindings.put("d", getSelectValue("d"));
    bindings.put("e", getSelectValue("e"));
    bindings.put("f", getSelectValue("f"));
    bindings.put("g", getSelectValue("g"));
    bindings.put("h", getSelectValue("h"));
    bindings.put("i", getSelectValue("i"));
    bindings.put("j", getSelectValue("j"));
  }

  public boolean doGroovyExecutionSharedBindings(int i, long j) throws ScriptException {
    if (bindings == null) {
      bindings = new SimpleBindings();
      initBindings(bindings);
    }
    return (boolean) requireNonNull(eval("return a < b", bindings));
  }

  public boolean doGroovyExecutionNewBindings(int i, long j) throws ScriptException {
    SimpleBindings localBindings = new SimpleBindings();
    initBindings(localBindings);
    return (boolean) requireNonNull(eval("return a < b", localBindings));
  }

  private SimpleBindings returnBindings;

  /** Callback with a string returning an Object. */
  @FunctionalInterface
  public static interface StringReturningDoubleCallback {
    double call(String s);
  }

  public boolean doGroovyExecutionWithSelectionBackIntoJvm(int i, long j) throws ScriptException {
    if (returnBindings == null) {
      returnBindings = new SimpleBindings();
      returnBindings.put("get", new StringReturningDoubleCallback() {

        @Override
        public double call(String s) {
          return getSelectValue(s);
        }

      });
    }
    return (boolean) requireNonNull(eval("return get('a') < get('b')", returnBindings));
  }

  public boolean doGroovyExecutionWithSelectionBackIntoJvmNewBindings(int i, long j) throws ScriptException {
    SimpleBindings localBindings = new SimpleBindings();
    localBindings.put("get", new StringReturningDoubleCallback() {

      @Override
      public double call(String s) {
        return getSelectValue(s);
      }

    });
    return (boolean) requireNonNull(eval("return get('a') < get('b')", localBindings));
  }

  /**
   * Scripting engine. Cached between calls so that we don't have to continually
   * reinit it (it takes a few seconds to create).
   */
  private static GroovyScriptEngineImpl engine = null;

  private static @Nullable Object eval(String command, Bindings bindings) throws ScriptException {
    if (engine == null) {
      System.out.println("Spawning Groovy engine...");
      ScriptEngineManager manager = new ScriptEngineManager();
      engine = (GroovyScriptEngineImpl) manager.getEngineByName("groovy");
    }

    engine.setBindings(bindings, ScriptContext.GLOBAL_SCOPE);
    return engine.eval(command, bindings);
  }

}
```
