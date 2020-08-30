import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import colors from 'vuetify/lib/util/colors'
import pt from 'vuetify/src/locale/pt.ts'

Vue.use(Vuetify);

const opts = {
    lang: {
        locales: { pt },
        current: 'pt',
    },
    icons: {
        iconfont: 'md'
    },
    theme: {
        dark: false,
        default: 'light',
        themes: {
            light: {
                primary: colors.purple.darken1,
                secondary: colors.red.lighten4,
                accent: colors.indigo.base,
                info: colors.blue,
                error: colors.pink.darken2,
                success: colors.teal.lighten1,
                warning: colors.purple.darken1,
                test: colors.shades.white
            },
        dark: {
                primary: colors.purple.darken1,
                accent: colors.indigo.darken1,
                info: colors.blue,
                error: colors.pink.darken2,
                success: colors.teal.lighten1,
                warning: colors.purple.darken1
            }
        }
    }
}

export default new Vuetify(opts)
