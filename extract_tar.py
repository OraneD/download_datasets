import tarfile
import os
from tqdm import tqdm
import concurrent.futures
import argparse

def extract_member(tar_gz_path, member, extract_path):
    with tarfile.open(tar_gz_path, 'r:gz') as tar:
        tar.extract(member, path=extract_path)

def extract_tar_file_threaded(tar_gz_path, extract_path='.'):
    with tarfile.open(tar_gz_path, 'r:gz') as tar:
        members = tar.getmembers()
    
    total_members = len(members)
    with concurrent.futures.ThreadPoolExecutor(max_workers=os.cpu_count()) as executor:
        list(tqdm(executor.map(lambda member: extract_member(tar_gz_path, member, extract_path), members), total=total_members, desc="Extracting"))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Extract tar.gz file using multithreading.")
    parser.add_argument("tar_gz_path", help="Path to the tar.gz file")
    parser.add_argument("extract_path", nargs="?", default='.', help="Path to extract the contents (default: current directory)")
    args = parser.parse_args()
    extract_tar_file_threaded(args.tar_gz_path, args.extract_path)

    