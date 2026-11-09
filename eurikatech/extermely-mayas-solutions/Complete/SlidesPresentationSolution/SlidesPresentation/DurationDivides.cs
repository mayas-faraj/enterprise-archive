using System;

namespace Maniyat.Presentation
{
    public static class DurationDivides
    {
        //public functions region

        /// <summary>
        /// set the duration for slides depending on image area, so if there is no image, the slide will not appear
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1</exception>
        public static void DividingByImageArea(SlideCollection slides, TimeSpan totalTime, Double showDurationPercent, Double hideDurationPercent)
        {
            DividingByImageArea(slides, totalTime, showDurationPercent, hideDurationPercent, 0, false);
        }

        /// <summary>
        /// set the duration for slides depending on image area, so if there is no image, the slide will not appear
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// <param name="elementsShiftPercent">percent of every slide duration reserve for delay between image element and text element</param>
        /// <param name="imageBeforeText">this parameter for set the ordinality, if it is true, the image will present and after delay time the text will present</param>
        /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1</exception>
        public static void DividingByImageArea(SlideCollection slides, TimeSpan totalTime, Double showDurationPercent, Double hideDurationPercent, Double elementShiftPercent, Boolean imageBeforeText)
        {
            DividingByImageArea(slides, totalTime, 0, showDurationPercent, hideDurationPercent, elementShiftPercent, imageBeforeText);
        }

        /// <summary>
        /// set the duration for slides depending on image area, so if there is no image, the slide will not appear
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="noImagePrecent">descipe the percent of totalTime that used for slides with no image</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// <param name="elementsShiftPercent">percent of every slide duration reserve for delay between image element and text element</param>
        /// <param name="imageBeforeText">this parameter for set the ordinality, if it is true, the image will present and after delay time the text will present</param>
        /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1, or noIMagePercent out of range 0..1</exception>
        public static void DividingByImageArea(SlideCollection slides, TimeSpan totalTime, Double noImagePrecent, Double showDurationPercent, Double hideDurationPercent, Double elementsShiftPercent, Boolean imageBeforeText)
        {
            //precodition: none
            if (slides != null)
            {
                if (noImagePrecent >= 0 && noImagePrecent <= 1)
                {
                    TimeSpan noImageTime = new TimeSpan();
                    TimeSpan pixelTime;
                    Int32 noImageCount = 0;
                    Double areaSummation = 0;

                    for (Int32 i = 0; i < slides.Count; i++)
                        if (slides[i].Image != null && slides[i].Image.Width != 0 && slides[i].Image.Height != 0)
                            areaSummation += slides[i].Image.Width * slides[i].Image.Height;
                        else
                            noImageCount++;

                    if (noImagePrecent != 0)
                    {
                        TimeSpan noImageTotalTime = multipleTimeSpan(totalTime, noImagePrecent);
                        noImageTime = dividesTimeSpan(noImageTotalTime, noImageCount);
                    }

                    pixelTime = dividesTimeSpan(totalTime, areaSummation / 10000);

                    for (Int32 i = 0; i < slides.Count; i++)
                        if (slides[i].Image != null && slides[i].Image.Width != 0 && slides[i].Image.Height != 0)
                            slideTimes(slides[i], multipleTimeSpan(pixelTime, slides[i].Image.Width * slides[i].Image.Height / 10000), showDurationPercent, hideDurationPercent, elementsShiftPercent, imageBeforeText);
                        else
                            slideTimes(slides[i], noImageTime, showDurationPercent, hideDurationPercent, elementsShiftPercent, imageBeforeText);
                }
                else
                    throw (new ArgumentOutOfRangeException("noImagePrecent", noImagePrecent, "noImagePrecent must be in reange 0..1"));

            }
            //postcondition: total time divides info slides by image area
        }

        /// <summary>
        /// set the duration for slides depending on text length in the text element, so empty text will not appear
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1</exception>
        public static void DividingByTextLength(SlideCollection slides, TimeSpan totalTime, Double showDurationPercent, Double hideDurationPercent)
        {
            DividingByTextLength(slides, totalTime, showDurationPercent, hideDurationPercent, 0, false);
        }

        /// <summary>
        /// set the duration for slides depending on text length in the text element, so empty text will not appear
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// <param name="elementsShiftPercent">percent of every slide duration reserve for delay between image element and text element</param>
        /// <param name="imageBeforeText">this parameter for set the ordinality, if it is true, the image will present and after delay time the text will present</param>
        /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1</exception>
        public static void DividingByTextLength(SlideCollection slides, TimeSpan totalTime, Double showDurationPercent, Double hideDurationPercent, Double elementsShiftPercent, Boolean imageBeforeText)
        {
            DividingByTextLength(slides, totalTime, 0, showDurationPercent, hideDurationPercent, elementsShiftPercent, imageBeforeText);
        }

        /// <summary>
        /// set the duration for slides depending on text length in the text element, so empty text will not appear
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="noTextPrecent">descipe the percent of totalTime that used for slides with no text</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// <param name="elementsShiftPercent">percent of every slide duration reserve for delay between image element and text element</param>
        /// <param name="imageBeforeText">this parameter for set the ordinality, if it is true, the image will present and after delay time the text will present</param>
        /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1, or noTextPercent out of range 0..1</exception>
        public static void DividingByTextLength(SlideCollection slides, TimeSpan totalTime, Double noTextPrecent, Double showDurationPercent, Double hideDurationPercent, Double elementsShiftPercent, Boolean imageBeforeText)
        {
            //precodition: none
            if (slides != null)
            {
                if (noTextPrecent >= 0 && noTextPrecent <= 1)
                {
                    TimeSpan noTextTime = new TimeSpan();
                    TimeSpan litterTime;
                    Int32 noTextCount = 0;
                    Int32 textsLength = 0;

                    for (Int32 i = 0; i < slides.Count; i++)
                        if (slides[i].Text != null && slides[i].Text.Text != "")
                            textsLength += slides[i].Text.Text.Length;
                        else
                            noTextCount++;

                    if (noTextPrecent != 0)
                    {
                        TimeSpan noTextTotalTime = multipleTimeSpan(totalTime, noTextPrecent);
                        noTextTime = dividesTimeSpan(noTextTotalTime, noTextCount);
                    }

                    litterTime = dividesTimeSpan(totalTime.Subtract(multipleTimeSpan(noTextTime, noTextCount)), textsLength);

                    for (Int32 i = 0; i < slides.Count; i++)
                        if (slides[i].Text != null && slides[i].Text.Text != "")
                            slideTimes(slides[i], multipleTimeSpan(litterTime, slides[i].Text.Text.Length), showDurationPercent, hideDurationPercent, elementsShiftPercent, imageBeforeText);
                        else
                            if (noTextPrecent != 0)
                                slideTimes(slides[i], noTextTime, showDurationPercent, hideDurationPercent, elementsShiftPercent, imageBeforeText);
                }
                else
                    throw (new ArgumentOutOfRangeException("noTextPrecent", noTextPrecent, "noTextPercent must be in reange 0..1"));


            }
            //postcondition: total time divides info slides by text length
        }

        /// <summary>
        /// set the duration for slides equality depending on specific parameters
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1</exception>
        public static void DividingEquality(SlideCollection slides, TimeSpan totalTime, Double showDurationPercent, Double hideDurationPercent)
        {
            DividingEquality(slides, totalTime, showDurationPercent, hideDurationPercent, 0, false);
        }

        /// <summary>
        /// set the duration for slides equality depending on specific parameters
        /// </summary>
        /// <param name="slides">slides collection that them duration will be setten</param>
        /// <param name="totalTime">total time of slides</param>
        /// <param name="showDurationPercent">percent of every slide duration reserve for showing the element</param>
        /// <param name="hideDurationPercent">percent of every slide duration reserve for hidding the element</param>
        /// <param name="elementsShiftPercent">percent of every slide duration reserve for delay between image element and text element</param>
        /// <param name="imageBeforeText">this parameter for set the ordinality, if it is true, the image will present and after delay time the text will present</param>
        /// <exception cref="ArgumentOutOfRangeException">accure when the sum of showDurationPercent and hideDurationPercent are begger than 1</exception>
        public static void DividingEquality(SlideCollection slides, TimeSpan totalTime, Double showDurationPercent, Double hideDurationPercent, Double elementsShiftPercent, Boolean imageBeforeText)
        {
            //precondition: none

            if (slides != null)
            {
                TimeSpan slideDuration = dividesTimeSpan(totalTime, slides.Count);

                for (Int32 i = 0; i < slides.Count; i++)
                    slideTimes(slides[i], slideDuration, showDurationPercent, hideDurationPercent, elementsShiftPercent, imageBeforeText);
            }
            //postcondition: divide total time into slides equality
        }

        //private functions region
        private static void slideTimes(Slide slide, TimeSpan slideDuration, Double showDurationPercent, Double hideDurationPercent, Double elementsShiftPercent, Boolean imageBeforeText)
        {
            //precondition: sum of <param>showDurationPercent and <param>hideDurationPercent are less than or equal 1
            if (slide.Text == null && slide.Image == null)
                //nothing to calculate
                return;
            else
            {
                if (showDurationPercent + hideDurationPercent <= 1)
                {
                    if ((elementsShiftPercent == 0) || (slide.Text == null ^ slide.Image == null))
                    {
                        //durationShift is not important
                        TimeSpan showDuration = multipleTimeSpan(slideDuration, showDurationPercent);
                        TimeSpan hideDuration = multipleTimeSpan(slideDuration, hideDurationPercent);
                        TimeSpan duration = slideDuration.Subtract(showDuration.Add(hideDuration));

                        if (slide.Text == null)
                        {
                            slide.Image.ShowEffectDuration = showDuration;
                            slide.Image.HideEffectDuration = hideDuration;
                            slide.Image.Duration = duration;
                        }
                        else
                            if (slide.Image == null)
                            {
                                slide.Text.ShowEffectDuration = showDuration;
                                slide.Text.HideEffectDuration = hideDuration;
                                slide.Text.Duration = duration;
                            }
                            else
                            {
                                slide.Text.ShowEffectDuration = slide.Image.ShowEffectDuration = showDuration;
                                slide.Text.HideEffectDuration = slide.Image.HideEffectDuration = hideDuration;
                                slide.Text.Duration = slide.Image.Duration = duration;
                            }
                    }
                    else
                    {
                        //there is durationShift and two elements
                        Element longestElement;
                        Element shortestElement;

                        TimeSpan shiftDuration = multipleTimeSpan(slideDuration, elementsShiftPercent);
                        TimeSpan shortestSlideDuration = slideDuration.Subtract(shiftDuration);

                        TimeSpan longestShowDuration = multipleTimeSpan(slideDuration, showDurationPercent);
                        TimeSpan longestHideDuration = multipleTimeSpan(slideDuration, hideDurationPercent);
                        TimeSpan longestDuration = slideDuration.Subtract(longestShowDuration.Add(longestHideDuration));

                        TimeSpan shortestShowDuration = multipleTimeSpan(shortestSlideDuration, showDurationPercent);
                        TimeSpan shortestHideDuration = multipleTimeSpan(shortestSlideDuration, hideDurationPercent);
                        TimeSpan shortestDuration = shortestSlideDuration.Subtract(shortestShowDuration.Add(shortestHideDuration));

                        if (imageBeforeText)
                        {
                            longestElement = slide.Image;
                            shortestElement = slide.Text;
                        }
                        else
                        {
                            longestElement = slide.Text;
                            shortestElement = slide.Image;
                        }

                        longestElement.ShowEffectDuration = longestShowDuration;
                        longestElement.HideEffectDuration = longestHideDuration;
                        longestElement.Duration = longestDuration;

                        shortestElement.ShowEffectDuration = shortestShowDuration;
                        shortestElement.HideEffectDuration = shortestHideDuration;
                        shortestElement.Duration = shortestDuration;
                    }
                }
                else
                    throw (new ArgumentOutOfRangeException("showDurationPercent and hideDurationPercent", showDurationPercent + hideDurationPercent, "The sum of show duration percent and hide duration percent must be less that or equal 1"));

            //postcondition: totalTime divides to all slides
            }
            

        }

        private static TimeSpan multipleTimeSpan(TimeSpan duration, Double amount)
        {
            return TimeSpan.FromMilliseconds(duration.TotalMilliseconds * amount);
        }

        private static TimeSpan dividesTimeSpan(TimeSpan duration, Double amount)
        {
            if (amount != 0)
                return TimeSpan.FromMilliseconds(duration.TotalMilliseconds / amount);
            else
                return new TimeSpan();
        }
    }
}
