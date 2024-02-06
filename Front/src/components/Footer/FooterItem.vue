<template>
  <div class="footer">
    <div class="footer__content content">
      <ul class="content__name name">
        <router-link to="/home" class="name__link">ConnectU</router-link>
        <div style="color: #4b5563">© 2024</div>
      </ul>
      <ul class="content__links links">
        <li class="links__item">
          <router-link to="/" class="links__link">О ConnectU</router-link>
        </li>
        <li class="links__item">
          <router-link to="/" class="links__link">Правила</router-link>
        </li>
        <li class="links__item">
          <router-link to="/" class="links__link">Для бизнеса</router-link>
        </li>
        <li class="links__item">
          <router-link to="/" class="links__link">Разработчикам</router-link>
        </li>
      </ul>
      <ul class="content__languages languages">
        <li class="languages__item">
          <a href="#" class="languages__link">Русский</a>
        </li>
        <li class="languages__item">
          <a href="#" class="languages__link">English</a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup>

</script>

<style lang="scss" scoped>
.footer {
  margin: 18px 0;
  &__content {
  }
}

.content {
  display: flex;
  justify-content: space-between;
  font-size: 13px;
  &__name {
    display: flex;
    gap: 10px;
  }

  &__links {
    display: flex;
    gap: 20px;
  }

  &__languages {
    display: flex;
    gap: 10px;
  }
}

.name {
  &__link {
    color: var(--link);
  }
}
.links {
  &__item {
  }

  &__link {
    color: var(--link);
  }
}

.languages {
  &__item {
  }

  &__link {
    color: var(--link);
  }
}
</style>