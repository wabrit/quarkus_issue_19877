# native build issue

This is a basic repro for the native build issue that occurs under the following circumstances:

 - Quarkus 2.2.1.Final (does _not_ occur on 2.1.2.Final)
 - Dependency `quarkus-opentelemetry-exporter-otlp` (I needed a few others to be included, perhaps to stimulate the otel SDK into doing something, but this appears to be the main trigger)
 - A config-mapped interface containing a property whose value is _only resolved at runtime_.

e.g. the following interface

```java
@ConfigMapping(prefix = "erewhon")
public interface ErewhonConfig {
  String user();
}
```

and `application.yaml`:

```yaml
erewhon:
  user: ${runtime_username}
```

To launch the native build use e.g.

```shell
mvn clean package -Pnative -Dquarkus.native.container-build=true -Dquarkus.container-image.build=true
```

