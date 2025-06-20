import os

def create_css_files(base_dir="css"):
    """
    Creates the CSS files for the project structure.
    Each file will be initially empty.
    """
    
    # Define the files to be created
    css_files = [
        "styles.css",
        "_variables.css",
        "_base.css",
        "_header.css",
        "_buttons.css",
        "_hero.css",
        "_problems.css",
        "_benefits.css",
        "_solutions.css",
        "_public-sector.css",
        "_comparison.css",
        "_testimonials.css",
        "_research.css",
        "_demo.css",
        "_about.css",
        "_utilities.css",
    ]

    # Create the base directory if it doesn't exist
    if not os.path.exists(base_dir):
        os.makedirs(base_dir)
        print(f"Created directory: {base_dir}/")
    else:
        print(f"Directory {base_dir}/ already exists.")

    # Create each CSS file
    for filename in css_files:
        file_path = os.path.join(base_dir, filename)
        try:
            with open(file_path, 'w') as f:
                # You can add initial content here if you want,
                # but for now, we'll leave them empty as per your request.
                if filename == "styles.css":
                    f.write("""/* Main Stylesheet - Imports all section-specific CSS files */

@import url('_variables.css');
@import url('_base.css');
@import url('_header.css');
@import url('_buttons.css');
@import url('_hero.css');
@import url('_problems.css');
@import url('_benefits.css');
@import url('_solutions.css');
@import url('_public-sector.css');
@import url('_comparison.css');
@import url('_testimonials.css');
@import url('_research.css');
@import url('_demo.css');
@import url('_about.css');
@import url('_utilities.css');

/* Responsive Design (global adjustments, if any, not specific to a section) */
@media (max-width: 768px) {
    .hero-section {
        text-align: center;
    }
}

@media (max-width: 576px) {
    .section-title {
        text-align: center;
    }
}
""")
                else:
                    f.write(f"/* Styles for {filename.replace('_', '').replace('.css', '')} */\n\n")
            print(f"Created file: {file_path}")
        except IOError as e:
            print(f"Error creating file {file_path}: {e}")

if __name__ == "__main__":
    create_css_files()
    print("\nAll CSS files have been created. Now you can copy-paste the content into each file.")
    print("Remember to link 'css/styles.css' in your HTML file.")
