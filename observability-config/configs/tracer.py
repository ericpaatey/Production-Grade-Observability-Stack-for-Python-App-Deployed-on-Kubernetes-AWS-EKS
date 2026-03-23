from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider

trace.set_tracer_provider(TracerProvider())
tracer = trace.get_tracer(__name__)

def process_log():
    with tracer.start_as_current_span("process-log"):
        # your logic
        pass