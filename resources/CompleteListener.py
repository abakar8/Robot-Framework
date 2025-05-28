class CompleteListener:
    ROBOT_LISTENER_API_VERSION = 2

    def start_suite(self, name, attrs):
        print(f"Suite '{name}' started.")

    def end_suite(self, name, attrs):
        print(f"Suite '{name}' ended with status: {attrs['status']}.")

    def start_test(self, name, attrs):
        print(f"Test '{name}' started.")

    def end_test(self, name, attrs):
        print(f"Test '{name}' ended with status: {attrs['status']}.")

    def start_keyword(self, name, attrs):
        print(f"Keyword '{name}' started. Type: {attrs.get('type')}")

    def end_keyword(self, name, attrs):
        print(f"Keyword '{name}' ended with status: {attrs['status']}.")

    def log_message(self, message):
        print(f"Log message: Level = {message['level']}, Message = {message['message']}")

    def output_file(self, path):
        print(f"Output file generated: {path}")

    def report_file(self, path):
        print(f"Report file generated: {path}")

    def log_file(self, path):
        print(f"Log file generated: {path}")

    def close(self):
        print("Execution finished. Listener is closing.")
