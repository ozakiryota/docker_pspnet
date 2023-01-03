import argparse
import numpy as np


class PaletteSort:
    def __init__(self):
        self.args = self.setArgument().parse_args()
    
    def setArgument(self):
        arg_parser = argparse.ArgumentParser()
        arg_parser.add_argument('--load_colors_path', required=True)
        arg_parser.add_argument('--load_names_path', required=True)
        arg_parser.add_argument('--save_colors_path', default='sorted_colors.txt')
        arg_parser.add_argument('--save_names_path', default='sorted_names.txt')
        return arg_parser

    def convert(self):
        original_colors = np.loadtxt(self.args.load_colors_path).astype('uint8')
        with open(self.args.load_names_path, 'r') as names_txt:
            original_names = names_txt.read().split("\n")
        new_colors = original_colors
        new_names = original_names
        for rgb, name in zip(original_colors, original_names):
            index = 0.299 * rgb[0] + 0.587 * rgb[1] + 0.114 * rgb[2]
            index = round(index)
            new_colors[index] = rgb
            new_names[index] = name
        with open(self.args.save_colors_path, 'w') as colors_txt:
            with open(self.args.save_names_path, 'w') as names_txt:
                for rgb, name in zip(new_colors, new_names):
                    for value in rgb:
                        colors_txt.write(str(value) + ' ')
                    colors_txt.write('\n')
                    names_txt.write(name + '\n')


if __name__ == '__main__':
    palette_sort = PaletteSort()
    palette_sort.convert()