require_relative '../workers/parser_worker'

# запуск воркера
ParserWorker.perform_async("hello", 123)