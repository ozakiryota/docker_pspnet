import argparse
import csv
import os


class TxtToCsv:
    def __init__(self):
        self.args = self.setArgument().parse_args()
    
    def setArgument(self):
        arg_parser = argparse.ArgumentParser()
        arg_parser.add_argument('--txt_path', required=True)
        arg_parser.add_argument('--csv_name', default='txt_to_csv.csv')
        return arg_parser

    def convert(self):
        dir_path = os.path.dirname(self.args.txt_path)
        csv_path = os.path.join(dir_path, self.args.csv_name)
        row_list = []
        with open(self.args.txt_path) as file_list_txt:
            file_name_list_list = file_list_txt.read().split('\n')
        with open(csv_path, 'w') as file_list_csv:
            csv_writer = csv.writer(file_list_csv)
            for file_name_list in file_name_list_list:
                file_name_list = [file_name for file_name in file_name_list.split(' ') if file_name != '']
                if file_name_list != []:
                    csv_writer.writerow(file_name_list)
        print("Save:", csv_path)


if __name__ == '__main__':
    txt_to_csv = TxtToCsv()
    txt_to_csv.convert()