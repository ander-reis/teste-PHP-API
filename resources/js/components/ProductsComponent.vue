<template>
    <div>
        <div class="pb-6">
            <v-btn color="primary" elevation="5" @click="create">Cadastrar Produto</v-btn>
        </div>
        <v-data-table
            :headers="headers"
            :items="desserts"
            :items-per-page="5"
            class="elevation-1"
            item-key="loading"
            :loading="loading" loading-text="Carregando... Por favor espere"
        >
            <template v-slot:item.value="{ item }">
                {{ 'R$ ' + item.value }}
            </template>

            <template v-slot:item.edit="{ item }">
                <v-icon
                    small
                    class="mr-2"
                    @click.prevent="modal('edit', item)"
                >edit
                </v-icon>
            </template>

            <template v-slot:item.delete="{ item }">
                <v-icon
                    small
                    class="mr-2"
                    @click.prevent="modal('delete', item)"
                >delete
                </v-icon>
            </template>
        </v-data-table>

        <!--dialog-->
        <v-dialog v-model="dialogEdit" max-width="800px">
            <v-card>
                <v-card-title>
                    <span class="headline">Editar</span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12" sm="12" md="12">
                                <v-text-field
                                    label="Nome"
                                    counter
                                    maxlength="80"
                                    v-model.trim="$v.dataItem.name.$model"
                                    :error-messages="NameErrors"
                                    :success="!$v.dataItem.name.$invalid"
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-text-field
                                label="Valor"
                                type="text"
                                hint="Entre com valor monetário"
                                counter
                                maxlength="10"
                                prepend-icon="attach_money"
                                v-model.trim="$v.dataItem.value.$model"
                                :error-messages="ValueErrors"
                                :success="!$v.dataItem.value.$invalid"
                            ></v-text-field>
                        </v-row>
                    </v-container>
                </v-card-text>

                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="closeEdit">Cancelar</v-btn>
                    <v-btn color="blue darken-1" :disabled="$v.dataItem.$invalid" text @click="update">Salvar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <v-dialog v-model="dialogDelete" max-width="800px">
            <v-card>
                <v-card-title>
                    <span class="headline">Excluir</span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        Excluir Produto?
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="closeDelete">Cancelar</v-btn>
                    <v-btn color="blue darken-1" text @click="deleteItem">Excluir</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>

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

    </div>
</template>

<script>
import {required, minLength} from 'vuelidate/lib/validators'
import snackbarConfigMixin from '../../mixins/snackbar-config'

export default {
    name: "ProductsComponent",
    mixins: [
        snackbarConfigMixin
    ],
    data() {
        return {
            dialog: false,
            dialogEdit: false,
            dialogDelete: false,
            editedIndex: -1,
            products: [],
            headers: [
                {text: 'ID', align: 'start', sortable: true, value: 'id',},
                {text: 'Nome', value: 'name'},
                {text: 'Valor', align: 'right', value: 'value'},
                {text: 'Editar', align: 'center', sortable: false, value: 'edit'},
                {text: 'Excluir', align: 'center', sortable: false, value: 'delete'},
            ],
            productItem: {
                id: '',
                name: '',
                value: '',
            },
            desserts: [],
            loading: true,
            dataItem: {
                name: undefined,
                value: undefined
            },
            defaultItem: {
                name: undefined,
                value: undefined
            },
        }
    },
    mounted() {
        this.loadProducts();
    },
    validations: {
        dataItem: {
            name: {required, minLength: minLength(3)},
            value: {required},
        }
    },
    watch: {
        dialogEdit(val) {
            val || this.closeEdit()
        },
        dialogDelete(val) {
            val || this.closeDelete()
        },
    },
    computed: {
        NameErrors() {
            const errors = []
            const name = this.$v.dataItem.name
            if (!name.$dirty) {
                return errors
            }
            !name.required && errors.push('Nome é obrigatório')
            !name.minLength && errors.push(`Insira pelo menos ${name.$params.minLength.min} caracteres!`)
            return errors
        },
        ValueErrors() {
            const errors = []
            const value = this.$v.dataItem.value
            if (!value.$dirty) {
                return errors
            }
            !value.required && errors.push('Valor é obrigatório')
            return errors
        },
    },
    methods: {
        loadProducts() {
            axios.get('/api/products')
                .then((response) => {
                    this.products = response.data.data;
                    this.desserts = this.products;
                    this.loading = false;
                })
                .catch(function (error) {
                    this.loading = false;
                });
        },
        modal(event, item) {
            this.editedIndex = this.desserts.indexOf(item)
            this.dataItem = Object.assign({}, item)
            console.log(this.dataItem.name)
            switch (event) {
                case 'edit':
                    this.dialogEdit = true
                    break
                case 'delete':
                    this.dialogDelete = true
                    break
            }
        },
        closeEdit() {
            this.dialogEdit = false
            setTimeout(() => {
                this.dataItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            }, 300)
        },
        closeDelete() {
            this.dialogDelete = false
            setTimeout(() => {
                this.dataItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            }, 300)
        },
        create() {
            this.$router.push({name: 'product.create'});
        },
        async update() {
            console.log(this.dataItem.id)
            try {
                await axios.put('api/products/' + this.dataItem.id, {
                    name: this.dataItem.name,
                    value: this.dataItem.value
                }).then(async (response) => {
                    await this.snackbarConfig(`Atualizado com Sucesso.`, 'success');
                    this.loadProducts();
                    this.dialogEdit = false;
                });
            } catch (error) {
                this.snackbarConfig(error.message, 'error')
            } finally {
                this.dialogDelete = false;
            }
        },
        async deleteItem() {
            const id = this.dataItem.id;
            try {
                await axios.delete('api/products/' + id).then(async (response) => {
                    await this.snackbarConfig(`ID: ${id} Excluído com Sucesso.`, 'error');
                    this.loadProducts();
                    this.dialogDelete = false;
                })
            } catch (error) {
                this.snackbarConfig(error.message, 'error')
            } finally {
                this.dialogDelete = false;
            }
        }
    }
}
</script>

<style scoped>

</style>
