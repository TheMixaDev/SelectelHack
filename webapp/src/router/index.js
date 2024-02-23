import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'redirector',
      component: () => import('../views/RedirectorView.vue')
    },
    {
      path: '/auth',
      name: 'auth',
      component: () => import('../views/AuthView.vue')
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/RegisterView.vue')
    },
    {
      path: '/rules',
      name: 'rules',
      component: () => import('../views/static/RulesView.vue')
    },
    {
      path: '/confidential',
      name: 'confidential',
      component: () => import('../views/static/ConfidentialView.vue')
    },
  ]
})

export default router
