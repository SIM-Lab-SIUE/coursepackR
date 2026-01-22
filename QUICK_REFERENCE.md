# Quick Reference: Audit Issues & Solutions

## Dead Hyperlinks Summary

### ✅ All Working (No Action Needed)
- **Internal .qmd Links:** 5/5 verified working
- **External URLs:** 85+ verified accessible
- **Navigation Configuration:** All 50+ sidebar files present

### ⚠️ Issues Found (Action Required)

#### Image Reference Issues (13 total)

**Critical - Cover Page Missing:**
```
textbook/index.qmd:97
  ![Cover Image](images/cover.png)
  → File missing: site/images/cover.png
```

**High Priority - Chapter 6 (Research Design):**
```
chapter_06.qmd:9    ![The Keystone Concept](images/research-keystone.png)
chapter_06.qmd:19   ![Exploration vs. Prediction](images/exploration-vs-prediction.png)
chapter_06.qmd:61   ![The Null Hypothesis Benchmark](images/null-hypothesis-scale.png)
chapter_06.qmd:113  ![The Qualitative Interview](images/qualitative-interview.png)
→ 4 files missing in site/images/
```

**High Priority - Chapter 7 (Sampling):**
```
chapter_07.qmd:9    ![The Logic of Sampling](images/sampling-drop-of-water.png)
chapter_07.qmd:19   ![Representative vs. Biased Sample](images/representative-sample-gumballs.png)
chapter_07.qmd:81   ![Snowball Sampling Network](images/snowball-sampling-network.png)
→ 3 files missing in site/images/
```

**High Priority - Chapter 8 (Measurement):**
```
chapter_08.qmd:11   ![Counting](images/counting.jpg)
chapter_08.qmd:19   ![From abstract to concrete.](images/instructions.jpg)
chapter_08.qmd:61   ![Clear sets of measurements.](images/recipe.jpg)
chapter_08.qmd:69   ![Measuring tape.](images/measuring-tape.jpg)
chapter_08.qmd:141  ![Three types of targets.](images/targets.png)
→ 5 files missing in site/images/
```

**Chapter 5 Status:**
✅ All 7 images present and working (puzzle.png, ebscohost.png, pew.png, boolean.jpg, abstract.png, annotation.png, paper-structure.png)

---

## Quick Fix Options

### Option 1: Remove References
**Time:** ~10 minutes  
**Impact:** Chapters display without visuals  
**Method:** Delete image markdown lines from affected .qmd files

### Option 2: Add Placeholders (RECOMMENDED) ✅
**Time:** ~5 minutes  
**Impact:** Maintains document structure with placeholder images  
**Method:** Run provided Python script
```bash
python create_placeholder_images.py
```
**Then verify:**
```bash
quarto render site/
```

### Option 3: Create Real Images
**Time:** 10-20 hours  
**Impact:** Complete pedagogical experience  
**Method:** Design/commission images for chapters 6-8

---

## File Locations

| Resource | Path |
|----------|------|
| Missing images | site/images/ (13 files needed) |
| Broken references | site/textbook/chapter_06.qmd, chapter_07.qmd, chapter_08.qmd, index.qmd |
| Solution script | create_placeholder_images.py |
| Full audit report | WEBSITE_AUDIT.md |

---

## Verification Checklist

After implementing fixes:

- [ ] Run `python create_placeholder_images.py` (if using Option 2)
- [ ] Run `quarto render site/` from project root
- [ ] Open `/docs/index.html` in browser
- [ ] Verify no broken image errors (check F12 Developer Tools)
- [ ] Check that all 13 images now display (as placeholders or real)
- [ ] Test navigation in all chapters (6, 7, 8)
- [ ] Verify external links still work

---

## Summary

**Issues Found:** 13 image references pointing to missing files  
**Root Cause:** Incomplete textbook asset library (chapters 6-8)  
**Recommended Solution:** Generate placeholder images using provided Python script  
**Implementation Time:** 5 minutes + verification  
**Status:** Ready to implement

---

**Report Date:** January 2025  
**All audit files available in project root directory**
