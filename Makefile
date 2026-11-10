# Lệnh vận hành chung. Gõ `make help` để xem danh sách.
COMPOSE ?= docker compose

.PHONY: help up down ps logs pipeline promote rollback

help:
	@echo "make up        dựng toàn bộ stack (build nếu cần)"
	@echo "make down      dừng stack, giữ volume"
	@echo "make ps        trạng thái container và cổng"
	@echo "make logs      xem log (S=api để xem một service)"
	@echo "make pipeline  fetch -> validate -> clean -> train (Sprint 2, TV2)"
	@echo "make promote V=N  gắn @champion cho version N (Sprint 2, TV4)"
	@echo "make rollback  đưa @champion về version trước (Sprint 2, TV4)"

up:
	@test -f .env || (echo "Thiếu .env: chạy cp .env.example .env rồi điền giá trị" && exit 1)
	$(COMPOSE) up -d --build
	$(COMPOSE) ps

down:
	$(COMPOSE) down

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs -f --tail=100 $(S)

pipeline promote rollback:
	@echo "Chưa làm: lệnh $@ thuộc Sprint 2" && exit 1
