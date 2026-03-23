#! /bin/bash

#Adding OpenTelemetry (Tracing)
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts

helm install otel-collector open-telemetry/opentelemetry-collector \
  --namespace observability --create-namespace

#Deploying Jaeger (Tracing UI)

helm repo add jaegertracing https://jaegertracing.github.io/helm-charts

helm install jaeger jaegertracing/jaeger \
  --namespace observability

#Python App with tracing

pip install opentelemetry-sdk opentelemetry-instrumentation-fastapi