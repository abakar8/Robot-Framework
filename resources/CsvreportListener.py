import csv

class CsvreportListener:
    ROBOT_LISTENER_API_VERSION = 2

    def __init__(self):
        self.csv_file = open("test_report.csv", "w", newline="")
        self.writer = csv.writer(self.csv_file)
        self.writer.writerow(["Test Name", "Status", "Message"])

    def end_test(self, name, attrs):
        self.writer.writerow([name, attrs['status'], attrs.get('message', '')])

    def close(self):
        self.csv_file.close()
        print("Custom CSV report generated: test_report.csv")

    def report_file(self, path):
        print(f"Report file generated: {path}")

    def log_file(self, path):
        print(f"Log file generated: {path}")

    def output_file(self, path):
        print(f"Output file generated: {path}")
