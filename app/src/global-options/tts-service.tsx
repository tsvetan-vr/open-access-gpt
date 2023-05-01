import { ttsPlugins } from "../core/plugins/metadata";
import { OptionGroup } from "../core/options/option-group";

const ttsPluginMetadata = ttsPlugins.map((p) => new p().describe());

export const ttsServiceOptions: OptionGroup = {
    id: "tts",
    options: [
        {
            id: "autoplay",
            displayOnSettingsScreen: "speech",
            defaultValue: false,
            displayAsSeparateSection: true,
            renderProps: (value, options, context) => {
                return {
                    type: "checkbox",
                    label: context.intl.formatMessage({
                        defaultMessage: "Read messages aloud automatically",
                    }),
                };
            },
        },
        {
            id: "service",
            displayOnSettingsScreen: "speech",
            defaultValue: "elevenlabs",
            displayAsSeparateSection: true,
            renderProps: (value, options, context) => {
                return {
                    type: "select",
                    label: context.intl.formatMessage({
                        defaultMessage: "Choose a Text-to-Speech Provider",
                    }),
                    options: ttsPluginMetadata.map((p) => ({
                        label: p.name,
                        value: p.id,
                    })),
                };
            },
        },
    ],
};
