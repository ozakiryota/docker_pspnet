import argparse
import os
from PIL import Image
import numpy as np


class RgbToGray:
    def __init__(self):
        self.args = self.setArgument().parse_args()
    
    def setArgument(self):
        arg_parser = argparse.ArgumentParser()
        arg_parser.add_argument('--load_list_path', required=True)
        arg_parser.add_argument('--load_colors_path', required=True)
        arg_parser.add_argument('--save_list_name', default='file_list_grayscaled.txt')
        return arg_parser

    def convert(self):
        palette = np.loadtxt(self.args.load_colors_path).astype('uint8').tolist()
        with open(self.args.load_list_path, 'r') as load_list_txt:
            file_pair_list = load_list_txt.read().split('\n')
        dir_path = os.path.dirname(self.args.load_list_path)
        save_list_path = os.path.join(dir_path, self.args.save_list_name)
        with open(save_list_path, 'w') as save_list_txt:
            for file_pair in file_pair_list:
                file_pair = file_pair.split(' ')
                if len(file_pair) > 1:
                    load_img_path = os.path.join(dir_path, file_pair[1])
                    rgb_img = Image.open(load_img_path).convert('RGB')
                    rgb_img_data = rgb_img.getdata()
                    width, height = rgb_img.size
                    gray_img = np.empty((height, width), dtype='uint8')
                    for y in range(height):
                        index_shift = y * width
                        for x in range(width):
                            rgb = list(rgb_img_data[index_shift + x])
                            lum = palette.index(rgb)
                            gray_img[y][x] = lum
                    save_img_path = load_img_path.split('.')[0] + '_grayscaled.' + load_img_path.split('.')[1]
                    Image.fromarray(gray_img).save(save_img_path)
                    save_list_txt.write(file_pair[0] + ' ' + os.path.basename(save_img_path) + '\n')
                    print("Saved:", save_img_path)


if __name__ == '__main__':
    rgb_to_gray = RgbToGray()
    rgb_to_gray.convert()