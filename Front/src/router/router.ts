import { createRouter, createWebHistory } from 'vue-router'
import { useUserStore } from "@/stores/userStore";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  //@ts-ignore
  routes: [
    {
      path: '/',
      redirect: '/auth',
    },
    {
      path: '/auth',
      name: 'auth',
      component: () => import('@/views/AuthenticationView.vue')
    },
    {
      path: '/feed',
      name: 'feed',
      component: () => import('@/views/FeedView.vue')
    },
    {
      path: '/:tag',
      name: 'profile',
      component: () => import('@/views/ProfileView.vue')
    },
    {
      path: '/images/:id/:tag',
      name: 'allImages',
      component: () => import('@/views/AllImagesView.vue')
    },
    {
      path: '/edit',
      name: 'edit',
      component: () => import('@/views/editUserView.vue')
    }
  ]
})

router.beforeEach((to, from, next) => {
  const store = useUserStore()
  if(to.path === '/auth' && store.user !== null) {
    next('/feed')
  } else {
    next()
  }
})
router.beforeEach((to, from, next) => {
  const store = useUserStore()
  if((to.path === '/feed' || to.path === '/profile') && store.user === null) {
    next('/auth')
  } else {
    next()
  }
})

export default router
