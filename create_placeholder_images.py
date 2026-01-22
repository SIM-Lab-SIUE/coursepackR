#!/usr/bin/env python3
"""
Generate placeholder images for missing textbook figures.
This creates simple PNG files with text labels for images referenced
but not present in site/images/.
"""

from PIL import Image, ImageDraw, ImageFont
import os

# Directory where images should be created
IMAGE_DIR = "site/images"

# Define missing images with their intended purpose
MISSING_IMAGES = {
    "cover.png": "Textbook Cover\n(Pending Design)",
    "counting.jpg": "Fig 8.1: Counting\nOperationalization Example",
    "instructions.jpg": "Fig 8.2: From Abstract\nto Concrete Instructions",
    "recipe.jpg": "Fig 8.3: Clear Sets of\nMeasurements (Recipe)",
    "measuring-tape.jpg": "Fig 8.4: Measuring Tape\nReliability & Validity",
    "targets.png": "Fig 8.5: Three Types\nof Measurement Targets",
    "sampling-drop-of-water.png": "Fig 7.1: The Logic of\nSampling (Water Drop)",
    "representative-sample-gumballs.png": "Fig 7.2: Representative vs.\nBiased Sample (Gumballs)",
    "snowball-sampling-network.png": "Fig 7.3: Snowball Sampling\nNetwork Diagram",
    "research-keystone.png": "Fig 6.1: The Keystone\nConcept in Research",
    "exploration-vs-prediction.png": "Fig 6.2: Exploration vs.\nPrediction Framework",
    "null-hypothesis-scale.png": "Fig 6.3: The Null\nHypothesis Benchmark",
    "qualitative-interview.png": "Fig 6.4: Qualitative\nInterview Setup",
}

def create_placeholder_image(filename: str, label: str, width: int = 800, height: int = 600):
    """Create a placeholder image with centered text."""
    # Color scheme: light gray background with dark text
    bg_color = (240, 240, 240)  # Light gray
    text_color = (60, 60, 60)   # Dark gray
    accent_color = (100, 150, 200)  # Blue accent

    # Create image
    img = Image.new('RGB', (width, height), bg_color)
    draw = ImageDraw.Draw(img)

    # Try to use a decent font, fall back to default if unavailable
    try:
        # Try common font locations
        font_paths = [
            "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",  # Linux
            "/System/Library/Fonts/Arial.ttf",  # macOS
            "C:\\Windows\\Fonts\\arial.ttf",  # Windows
        ]
        font = None
        for font_path in font_paths:
            if os.path.exists(font_path):
                font = ImageFont.truetype(font_path, 32)
                break
        if not font:
            font = ImageFont.load_default()
    except:
        font = ImageFont.load_default()

    # Draw border
    border_width = 3
    draw.rectangle(
        [(border_width, border_width), (width - border_width, height - border_width)],
        outline=accent_color,
        width=border_width
    )

    # Draw title
    title = "[ PLACEHOLDER IMAGE ]"
    title_bbox = draw.textbbox((0, 0), title, font=font)
    title_width = title_bbox[2] - title_bbox[0]
    title_x = (width - title_width) // 2
    draw.text((title_x, 50), title, fill=accent_color, font=font)

    # Draw label (centered)
    label_lines = label.split('\n')
    line_height = 40
    total_text_height = len(label_lines) * line_height
    start_y = (height - total_text_height) // 2

    for i, line in enumerate(label_lines):
        line_bbox = draw.textbbox((0, 0), line, font=font)
        line_width = line_bbox[2] - line_bbox[0]
        x = (width - line_width) // 2
        y = start_y + (i * line_height)
        draw.text((x, y), line, fill=text_color, font=font)

    # Draw footer
    footer = "Content to be added"
    footer_bbox = draw.textbbox((0, 0), footer, font=font)
    footer_width = footer_bbox[2] - footer_bbox[0]
    footer_x = (width - footer_width) // 2
    draw.text((footer_x, height - 60), footer, fill=(180, 180, 180), font=font)

    return img

def main():
    """Generate all placeholder images."""
    # Create directory if it doesn't exist
    os.makedirs(IMAGE_DIR, exist_ok=True)

    print("Generating placeholder images...")
    print(f"Target directory: {IMAGE_DIR}\n")

    for filename, label in MISSING_IMAGES.items():
        filepath = os.path.join(IMAGE_DIR, filename)

        # Determine image dimensions based on type
        if "cover" in filename:
            width, height = 600, 900  # Portrait for cover
        else:
            width, height = 800, 600  # Landscape for figures

        # Create and save image
        img = create_placeholder_image(filename, label, width, height)

        # Save with appropriate format
        if filename.endswith('.jpg'):
            img.save(filepath, 'JPEG', quality=85)
        else:
            img.save(filepath, 'PNG')

        print(f"✓ Created: {filename} ({width}x{height})")

    print(f"\nTotal placeholders created: {len(MISSING_IMAGES)}")
    print("\nNext step: Test website compilation with 'quarto render'")

if __name__ == "__main__":
    main()
