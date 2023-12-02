import os
import subprocess

def find_test_files(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.cl'):
                yield os.path.join(root, file)

def run_test(file_path):
    process = subprocess.run(['./src/coolc.sh', file_path], capture_output=True, text=True)
    return process.returncode, process.stdout, process.stderr


def main():
    test_files_directory = 'tests'  
    passed_tests = 0
    failed_tests = 0
    total_tests = 0

    for test_file in find_test_files(test_files_directory):
        total_tests += 1
        returncode, stdout, stderr = run_test(test_file)

        print(f"Testing: {test_file}")
        if returncode == 0:
            print("Test Passed")
            passed_tests += 1
        else:
            print("Test Failed")
            print(f"Errors: {stderr}")
            failed_tests += 1

    print(f"\nTotal tests: {total_tests}")
    print(f"Passed: {passed_tests}")
    print(f"Failed: {failed_tests}")

if __name__ == "__main__":
    main()
