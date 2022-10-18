# Prometheus

- Prometheus is a monitoring system and time series database that is especially well-suited for monitoring dynamic cloud environments. It features a dimensional data model as well as a powerful query language and integrates aspects such as instrumentation, gathering of metrics, service discovery, and alerting, all in one ecosystem.
- Prometheus provides tools or integrates with other ecosystem components to provide a full monitoring pipeline:
  - Tracking and exposing metrics (instrumentation),
  - Collecting metrics,
  - Storing metrics,
  - Querying metrics for alerting, dashboarding, and more.

- An organization will typically run one or more Prometheus servers, which form the heart of a Prometheus monitoring setup. You configure a Prometheus server to discover a set of metrics sources (so-called "targets") using service-discovery mechanisms such as DNS, Consul, Kubernetes, or others. Prometheus then periodically pulls (or "scrapes") metrics in a text-based format from these targets over HTTP and stores the collected data in a local time series database. The Prometheus server then makes the collected data available for queries, either via its built-in web UI, using dashboarding tools such as Grafana, or by direct use of its HTTP API.
- You can also configure the Prometheus server to generate alerts based on the collected data.  Prometheus forwards the raw alerts to the Prometheus Alertmanager, a central place to group, aggregate, and route those alerts, which runs as a separate service. Alertmanager sends out notifications via email, Slack, PagerDuty, or other notification services.
- Features:
  - A dimensional data model that allows faceted tracking of metrics,
  - A powerful query language (PromQL) to provide flexible answers,
  - Integration of time series processing and alerting,
  - Integration with service discovery mechanisms to determine what should be monitored and how,
  - Operational simplicity,
  - An efficient implementation.
- Series identifiers: Every series is uniquely identified by a metric name and a set of key/value pairs called "labels".
- Series samples: Samples form the bulk data of a series and are appended to an indexed series over time:
  - Timestamps are 64-bit integers in millisecond precision.
  - Sample values are 64-bit floating point numbers.
- Services that want to expose Prometheus metrics simply need to expose an HTTP endpoint providing metrics in Prometheus' text-based exposition format.
- PromQL is a functional language that is optimized for evaluating flexible and efficient computations on time series data
- Philosophy is to collect as much data about your systems as possible in a single data model so that you can then formulate integrated queries over it. The same query language that is used for ad-hoc queries and dashboarding is also used for defining alerting rules.
- The PromQL expression in the expr field forms the core of an alerting rule, while additional YAML-based configuration options allow controlling alert metadata, routing labels, and more. This enables precise and accurate alerting based on collected data.
- To create a highly available (HA) setup for alerting, you can still run two identically configured Prometheus servers computing the same alerts (the Alertmanager will deduplicate notifications)
- A single large Prometheus server can ingest up to 1 million time series samples per second and uses 1-2 bytes for the storage of each sample on disk. It can handle several million concurrently active (present in one scrape iteration of all targets) time series at once.
- Prometheus collects metrics from monitored targets by scraping metrics HTTP endpoints on these targets. Since Prometheus also exposes data in the same way about itself, it can also scrape and monitor its own health.