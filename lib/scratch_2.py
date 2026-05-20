from PIL import Image, ImageDraw

img = Image.new("RGBA", (32, 32), (30, 30, 30, 255))
draw = ImageDraw.Draw(img)

# rails
draw.line((8, 0, 8, 32), fill=(180, 180, 180), width=3)
draw.line((24, 0, 24, 32), fill=(180, 180, 180), width=3)

# sleepers
for y in range(0, 32, 8):
    draw.line((4, y, 28, y), fill=(120, 70, 20), width=2)

img.save("track.png")
