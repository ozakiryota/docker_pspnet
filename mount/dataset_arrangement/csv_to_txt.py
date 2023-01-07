import argparse
import csv
import os


class CsvToTxt:
    def __init__(self):
        self.args = self.setArgument().parse_args()
    
    def setArgument(self):
        arg_parser = argparse.ArgumentParser()
        arg_parser.add_argument('--csv_path', required=True)
        arg_parser.add_argument('--txt_name', default='csv_to_txt.txt')
        arg_parser.add_argument('--target_col_list', nargs='+', type=int, default=[0])
        return arg_parser

    def convert(self):
        dir_path = os.path.dirname(self.args.csv_path)
        txt_path = os.path.join(dir_path, self.args.txt_name)
        row_list = []
        with open(self.args.csv_path) as csv_data:
            row_list = csv.reader(csv_data)
            with  open(txt_path, 'w') as txt_data:
                for row in row_list:
                    for col in self.args.target_col_list:
                        txt_data.write(row[col] + ' ')
                    txt_data.write('\n')
        print("Save:", txt_path)


if __name__ == '__main__':
    csv_to_txt = CsvToTxt()
    csv_to_txt.convert()