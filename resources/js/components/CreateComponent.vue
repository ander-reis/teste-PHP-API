<template>
    <div>
        <h1>Cadastrar Produto</h1>
        <v-overlay :value="loading">
            <v-progress-circular indeterminate size="64"></v-progress-circular>
        </v-overlay>
        <v-form>
            <v-text-field
                name="name"
                label="Nome"
                counter
                maxlength="80"
                v-model.trim="$v.form.name.$model"
                :error-messages="NameErrors"
                :success="!$v.form.name.$invalid"
                :value="form.name"
            ></v-text-field>
            <v-text-field
                name="value"
                label="Valor"
                type="number"
                hint="Entre com valor monetário"
                counter
                maxlength="10"
                prepend-icon="attach_money"
                v-model.trim="$v.form.value.$model"
                :error-messages="ValueErrors"
                :success="!$v.form.value.$invalid"
                :value="form.value"
            ></v-text-field>
            <v-btn
                :disabled="$v.$invalid"
                color="success"
                class="mr-4 mt-5"
                @click="submit"
            >Cadastrar
            </v-btn>

            <v-snackbar v-model="showSnackbar" top :color="snackbarColor">
                {{ message }}
                <template v-slot:action="{ attrs }">
                    <v-btn
                        color="white"
                        text
                        v-bind="attrs"
                        @click="showSnackbar = false"
                    >
                        <v-icon>close</v-icon>
                    </v-btn>
                </template>
            </v-snackbar>

        </v-form>
    </div>
</template>

<script>
import {required, minLength} from 'vuelidate/lib/validators'
import snackbarConfigMixin from '../../mixins/snackbar-config'
export default {
    name: "CreateComponent",
    mixins: [
        snackbarConfigMixin
    ],
    data() {
        return {
            loading: true,
            form: {
                name: '',
                value: ''
            },
        }
    },
    mounted() {
        this.loading = false;
    },
    validations: {
        form: {
            name: {required, minLength: minLength(3)},
            value: {required},
        }
    },
    computed: {
        NameErrors() {
            const errors = []
            const name = this.$v.form.name
            if (!name.$dirty) {
                return errors
            }
            !name.required && errors.push('Nome é obrigatório')
            !name.minLength && errors.push(`Insira pelo menos ${name.$params.minLength.min} caracteres!`)
            return errors
        },
        ValueErrors() {
            const errors = []
            const value = this.$v.form.value
            if (!value.$dirty) {
                return errors
            }
            !value.required && errors.push('Valor é obrigatório')
            return errors
        },
    },
    methods: {
        async submit() {
            await axios.post('/api/products', this.form)
                .then(() => {
                    this.snackbarConfig('Criado com Sucesso.', 'success')
                }).catch(function (error) {
                this.snackbarConfig('Error', 'error')
            });
            setTimeout(() => {
                this.$router.push('/');
            }, 1000);
        }
    }
}
</script>

<style scoped>

</style>
