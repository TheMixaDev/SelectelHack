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
      path: '/restore',
      name: 'restore',
      component: () => import('../views/RestoreView.vue')
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/RegisterView.vue')
    },
    {
      path: '/donation/create',
      name: 'createDonation',
      component: () => import('../views/authorized/donations/CreateDonationView.vue')
    },
    {
      path: '/donation/plan',
      name: 'planDonation',
      component: () => import('../views/authorized/donations/PlanDonationView.vue')
    },
    {
      path: '/profile/setup',
      name: 'setupProfile',
      component: () => import('../views/authorized/user/SetupProfileView.vue')
    },
    {
      path: '/stations',
      name: 'stations',
      component: () => import('../views/authorized/stations/BloodStationsView.vue')
    },
    {
      path: '/bonuses',
      name: 'bonuses',
      component: () => import('../views/authorized/bonuses/BonusesView.vue')
    },
    {
      path: '/top',
      name: 'top',
      component: () => import('../views/authorized/user/DonationsTopView.vue')
    },
  ]
})

export default router
