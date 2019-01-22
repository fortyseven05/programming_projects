using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Kyle Duncan
public class Weapon2Shoot : WeaponBase
{
    public Transform shellSpawn;

    private float fireRate = .3f;
    private float timeToFire = 0.0f;

    public override void fire()
    {
        if (Time.time > timeToFire)
        {
            AudioSource.PlayClipAtPoint(fireClip, player.transform.position, .5f);

            timeToFire = Time.time + fireRate;

            Rigidbody shellInstance2 = Instantiate(shell, shellSpawn.position, shellSpawn.rotation) as Rigidbody;
            shellInstance2.velocity = shellSpawn.forward * projectileSpeed;


        }

    }
}
