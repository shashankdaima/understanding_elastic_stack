import dramatiq
from dramatiq.brokers.redis import RedisBroker

from app.config import settings

broker = RedisBroker(url=settings.redis_url)
dramatiq.set_broker(broker)


@dramatiq.actor
def process_item(item_id: int, name: str):
    """Example background task: simulate processing an item."""
    print(f"[worker] Processing item {item_id}: {name}")
    # Put your heavy work here (e.g. send email, call external API, index to Elasticsearch)
    print(f"[worker] Done processing item {item_id}")
