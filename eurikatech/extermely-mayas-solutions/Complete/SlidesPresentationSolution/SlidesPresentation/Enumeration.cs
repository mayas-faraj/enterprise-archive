namespace Maniyat.Presentation
{
    /// <summary>
    /// type of effects that will apply when the element is showing or hidding
    /// </summary>
    public enum TransitionEffect
    {
        None,
        Fading,
        Resizing,
        ResizingWidth,
        ResizingHeight,
        Blurring
    }

    /// <summary>
    /// type of effect that will apply when the element is visible
    /// </summary>
    public enum ConstantEffect
    {
        None,
        Fading,
        Blurring,
        Rotating,
        Resizing,
        ResizingWidth,
        ResizingHeight
    }

    internal enum TimerPhase
    {
        Initial,
        First,
        Second,
        Third,
        Fourth,
        Finishing
    }
}
