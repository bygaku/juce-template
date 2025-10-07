#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

//==============================================================================
class PluginAudioProcessorEditor final : public juce::AudioProcessorEditor
{
public:
    explicit PluginAudioProcessorEditor (PluginAudioProcessor&);
    ~PluginAudioProcessorEditor() override;

    //==============================================================================
    void paint (juce::Graphics&) override;
    void resized() override;

private:
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    PluginAudioProcessor& processorRef;    
    
    // example image from binary data
    std::unique_ptr<juce::Drawable> exampleImage;

private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (PluginAudioProcessorEditor)

};
