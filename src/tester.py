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
    for test_file in find_test_files(test_files_directory):
        returncode, stdout, stderr = run_test(test_file)


if __name__ == "__main__":
    main()
