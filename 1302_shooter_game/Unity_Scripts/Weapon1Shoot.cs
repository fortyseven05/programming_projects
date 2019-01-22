using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Kyle Duncan
public class Weapon1Shoot : WeaponBase
{
    public Transform shellSpawn;

    private float fireRate = .2f;
    private float timeToFire = 0.0f;

    public override void fire()
    {
        if (Time.time > timeToFire)
        {
            AudioSource.PlayClipAtPoint(fireClip, player.transform.position);

            timeToFire = Time.time + fireRate;

            Rigidbody shellInstance = Instantiate(shell, shellSpawn.position, shellSpawn.rotation) as Rigidbody;
            shellInstance.velocity = shellSpawn.forward * projectileSpeed;



        }
    }
}
