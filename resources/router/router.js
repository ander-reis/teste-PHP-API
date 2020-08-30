import Vue from 'vue';
import VueRouter from 'vue-router';
import CreateComponent from "../js/components/CreateComponent";
import ProductsComponent from "../js/components/ProductsComponent";

Vue.use(VueRouter);

const routes = [
    {
        path: '/',
        component: ProductsComponent,
        name: 'products.list'
    },
    {
        path: '/cadastrar',
        component: CreateComponent,
        name: 'product.create'
    },
];

const router = new VueRouter({
    mode: 'history',
    linkActiveClass: 'active',
    routes,
});

export default router;
